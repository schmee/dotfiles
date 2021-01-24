{:user {:plugins [[lein-ancient "0.6.15"]
                  [lein-cljfmt "0.7.0"]
                  [lein-monolith "1.5.0"]
                  [venantius/ultra "0.6.0"]]
        :dependencies [[hashp "0.2.0"]
                       [lambdaisland/deep-diff2 "2.0.108"]
                       [org.clojure/tools.namespace "1.0.0"]
                       [schmee/repl-tools "SNAPSHOT" :exclusions [[org.clojure/clojurescript]]]]
        :injections [(require 'hashp.core)
                     (require 'debux.core)]
        :repl-options {:caught io.aviso.repl/pretty-pst
                       :init (do (require 'clojure.tools.namespace.repl)
                                 (require '[lambdaisland.deep-diff2 :as dd])
                                 (let [refresh (fn []
                                                 (let [e (clojure.tools.namespace.repl/refresh)]
                                                   (when (instance? Throwable e)
                                                     (throw e))))
                                       dd (fn [a b]
                                            (dd/pretty-print (dd/diff a b)))]
                                   (intern 'clojure.core 'refresh refresh)
                                   (intern 'clojure.core 'dd dd)
                                   (refresh)))}
        :ultra {:repl {:extend-notation false
                       :namespace-maps false
                       :seq-limit 1000
                       :width 80}}}}
