(require '[babashka.fs :as fs])

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
     ["profiles.clj" ".lein/profiles.clj"]]))

(defn copy [paths]
  (doseq [[file path] paths]
    (println "cp" file "->" (.toString path))
    (fs/copy file path {:replace-existing true})))

(defn copy-to [paths]
  (copy paths))

(defn read-from [paths]
  (let [flipped (mapv (fn [[file path]] [path file]) paths)]
    (copy flipped)))

(condp = (first *command-line-args*)
  "read" (read-from paths)
  "write" (copy-to paths)
  (println "unknown"))
