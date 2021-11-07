#!/usr/bin/env bb

(ns zig-install
  (:require [babashka.curl :as curl]
            [babashka.fs :as fs]
            [cheshire.core :as json]
            [clojure.java.io :as io]
            [clojure.java.shell :refer [sh]]))

(def home (System/getProperty "user.home"))
(def dir (.getParent (fs/path *file*)))
(def dir-str (.toString dir))
(def index-url "https://ziglang.org/download/index.json")
(def zig-version (fs/file dir ".zig-version"))

(defn p [& paths]
  (apply fs/path dir paths))

(defn -load-index []
  (-> index-url
      curl/get
      :body
      (json/decode true)))

(def load-index
  (memoize -load-index))

(defn get-download-link [index version]
  (-> index version :x86_64-macos :tarball))

(defn download-tarball [tarball-link]
  (io/copy
    (:body (curl/get tarball-link {:as :stream}))
    (fs/file dir "zig.tar.xz")))

(defn install []
  (let [index (load-index)
        version (or (-> *command-line-args* first keyword) :master)
        link (get-download-link index version)]
    (println "Installing" link)
    (if (= link (slurp zig-version))
      (println "Specified version already installed, nothing to do")
      (do
        (download-tarball link)
        (sh "mkdir" "zig" :dir dir-str)
        (sh "tar" "-xzf" "zig.tar.xz" "-C" "zig" "--strip-components=1" :dir dir-str)
        (fs/copy (p "zig" "zig") "/usr/local/bin" {:replace-existing true})
        (fs/copy-tree (p "zig" "lib") "/usr/local/lib" {:replace-existing true})
        (fs/delete (p "zig.tar.xz"))
        (fs/delete-tree (p "zig"))
        (spit zig-version link)))))

(install)

(comment
  (def link (-> (load-index) get-download-link))
  (spit zig-version link)
  (slurp zig-version)
  (install-most-recent))
