#!/usr/bin/env bb

(ns setup
  (:require [babashka.fs :as fs]
            [clojure.java.shell :as shell]
            [clojure.string :as str]))

(defn sh [& args]
  (-> (apply shell/sh args)
      :out
      str/trim))

(def home (System/getProperty "user.home"))
(def dotfiles (fs/path home "dotfiles"))

(def benchmark-shell
  {:ask? false
   :desc "Benchmark with Hyperfine"
   :fn (fn []
         @(babashka.process/process ["hyperfine" "--warmup" "3" "zsh -i -c exit"] {:inherit true})
         nil)})

(def paths
  (mapv
    (fn [m] (assoc m :path (fs/path home (:path m))))
    [
     ; ["gitconfig" ".gitconfig"]
     {:file "evalcache.zsh"
      :path "evalcache.zsh"}
     {:file "gitignore_global"
      :path ".gitignore_global"}
     {:file "init.vim"
      :path ".config/nvim/init.vim"}
     {:file "inputrc"
      :path ".inputrc"}
     {:file "kitty.conf"
      :path ".config/kitty/kitty.conf"}
     {:file "p10k.zsh"
      :path ".p10k.zsh"
      :post-update-hooks [benchmark-shell]}
     {:file "profiles.clj"
      :path ".lein/profiles.clj"}
     {:file "zshrc"
      :path ".zshrc"
      :post-update-hooks [benchmark-shell]}
     {:file "zlogin"
      :path ".zlogin"}
     {:file "ideavimrc"
      :path ".ideavimrc"}]))

(defn run-post-update-hook [{:keys [ask? fn desc]}]
  (if ask?
    (do
      (println "run post update hook:" desc "?")
      (let [answer (read)]
        (when (= answer 'y)
          (fn))))
    (do
      (println "running post update hook:" desc)
      (fn))))

(defn diff? [a b]
  (let [a-hash (sh "md5" "-q" (.toString a))
        b-hash (sh "md5" "-q" (.toString b))]
    (not= a-hash b-hash)))

(defn copy [paths]
  (doseq [{:keys [file path post-update-hooks]} paths]
    (when (diff? file path)
      (println "cp" file "->" (.toString path))
      (fs/copy file path {:replace-existing true})
      (doseq [hook post-update-hooks]
        (run-post-update-hook hook)))))

(defn copy-to [paths]
  (copy paths))

(defn read-from [paths]
  (let [flipped (mapv (fn [{:keys [file path]}] {:file path :path file}) paths)]
    (copy flipped)))

(defn diff [paths]
  (doseq [{:keys [file path]} paths]
    @(babashka.process/process ["git" "--no-pager" "diff" file path] {:inherit true})
    nil))

(defn patch-fzf []
  (let [fzf-path (sh "brew" "--prefix" "fzf")
        path-to-file (str fzf-path "/shell/key-bindings.zsh")]
    (println "Patching " path-to-file)
    (sh "patch" "-u" path-to-file (.toString (fs/path dotfiles "key-bindings.patch")))))

(defn create-if-not-exists [path]
  (if (fs/exists? path)
    (println "Path already exists: " path)
    (fs/create-dir path)))

(defn bootstrap []
  (println "Bootstrapping...")
  (create-if-not-exists (fs/path home ".config"))
  (create-if-not-exists (fs/path home ".config/kitty"))
  (create-if-not-exists (fs/path home ".config/nvim"))
  (create-if-not-exists (fs/path home ".lein"))
  (create-if-not-exists (fs/path home ".hushlogin"))
  (copy-to paths))

(condp = (first *command-line-args*)
  "read" (read-from paths)
  "write" (copy-to paths)
  "diff" (diff paths)
  "bootstrap" (bootstrap)
  (println "unknown command"))
