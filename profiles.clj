{:user {:plugins [[cider/cider-nrepl "0.26.0"]
                  [lein-ancient "0.7.0"]
                  [lein-cljfmt "0.8.0"]
                  [lein-monolith "1.7.0"]]
                  ; [venantius/ultra "0.6.0"]
        :dependencies [[hashp "0.2.1"]
                       [lambdaisland/deep-diff2 "2.0.108"]
                       [org.clojure/tools.namespace "1.1.0"]
                       [philoskim/debux "0.8.1"]]
        :injections [(require 'hashp.core)
                     (require 'debux.core)]
        :repl-options {;; :caught io.aviso.repl/pretty-pst
                       :init (do (require '[lambdaisland.deep-diff2 :as dd])
                                 (let [dd (fn [a b]
                                            (dd/pretty-print (dd/diff a b)))]
                                   (intern 'clojure.core 'dd dd)))}
        :deploy-repositories [["clojars" {:url "https://clojars.org/repo"
                                          :sign-releases false}]]
        :ultra {:repl {:extend-notation false
                       :namespace-maps false
                       :seq-limit 1000
                       :width 80}}}}
