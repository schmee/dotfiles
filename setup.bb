#!/usr/bin/env bb

(require '[babashka.fs :as fs])
(require '[clojure.java.shell :refer [sh]])

(def home (System/getProperty "user.home"))

(def paths
  (mapv
    (fn [[file path]] [file (fs/path home path)])
    [
     ; ["gitconfig" ".gitconfig"]
     ["gitignore_global" ".gitignore_global"]
     ["init.vim" ".config/nvim/init.vim"]
     ["inputrc" ".inputrc"]
     ["zshrc" ".zshrc"]
     ["p10k.zsh" ".p10k.zsh"]
     ["evalcache.zsh" "evalcache.zsh"]
     ["profiles.clj" ".lein/profiles.clj"]]))

(defn diff? [a b]
  (let [a-hash (:out (sh "md5" "-q" (.toString a)))
        b-hash (:out (sh "md5" "-q" (.toString b)))]
    (not= a-hash b-hash)))

(defn copy [paths]
  (doseq [[file path] paths]
    (when (diff? file path)
      (println "cp" file "->" (.toString path))
      (fs/copy file path {:replace-existing true}))))

(defn copy-to [paths]
  (copy paths))

(defn read-from [paths]
  (let [flipped (mapv (fn [[file path]] [path file]) paths)]
    (copy flipped)))

(defn diff [paths]
  (doseq [[a b] paths]
    @(babashka.process/process ["git" "--no-pager" "diff" a b] {:inherit true})
    nil))

(condp = (first *command-line-args*)
  "read" (read-from paths)
  "write" (copy-to paths)
  "diff" (diff paths)
  (println "unknown command"))
