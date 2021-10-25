{:user {:plugins [[cider/cider-nrepl "0.26.0"]
                  [lein-ancient "0.7.0"]
                  [lein-cljfmt "0.8.0"]
                  [lein-monolith "1.7.0"]]
                  ; [lein-nodisassemble "0.1.3"]]
                  ; [venantius/ultra "0.6.0"]]
        :dependencies [[hashp "0.2.1"]
                       [lambdaisland/deep-diff2 "2.0.108"]
                       [org.clojure/tools.namespace "1.1.0"]
                       [philoskim/debux "0.8.1"]
                       [vvvvalvalval/scope-capture "0.3.2"]]
        :injections [(require 'hashp.core)
                     (require 'debux.core)
                     (intern 'clojure.core (with-meta 'dbg {:macro true}) @#'debux.core/dbg)
                     (intern 'clojure.core (with-meta 'dbgn {:macro true}) @#'debux.core/dbgn)
                     (require 'sc.api)]
        :repl-options {;; :caught io.aviso.repl/pretty-pst
                       :init (do (require '[lambdaisland.deep-diff2 :as dd])
                                 (let [dd (fn [a b]
                                            (dd/pretty-print (dd/diff a b)))]
                                   (intern 'clojure.core 'dd dd)))}
        :deploy-repositories [["clojars" {:url "https://clojars.org/repo"
                                          :sign-releases false}]]}}
        ; :ultra {:repl {:extend-notation false
        ;                :namespace-maps false
        ;                :seq-limit 1000
        ;                :width 80}}}}
