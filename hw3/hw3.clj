(defn validateExpression
  [ex]
  (re-matches #"[[0-9]+|\+|\-|\*|/|\s]+" ex))

(defn parseExpression
  [ex]
  (re-seq #"[0-9]+|\+|\-|\*|/" ex))

(defn expr
  [ex]
  (let [exr (term ex)]
    (if (seq? exr)
      (exprp exr)
      (boolean exr))))

(defn exprp
  [ex]
  (cond
   (empty? ex) true
   (re-matches #"\+|-" (first ex)) (expr (rest ex))
   :else ex))

(defn term
  [ex]
  (cond
   (empty? ex) false
   (re-matches #"[0-9]+" (first ex)) (termp (rest ex))
   :else false))

(defn termp
  [ex]
  (cond
   (empty? ex) true
   (re-matches #"\*|/" (first ex)) (term (rest ex))
   :else ex))

(defn evaluate
  [ex]
  (and
   (boolean (validateExpression ex))
   (let [exseq (parseExpression ex)]
     (true? (expr exseq)))))
