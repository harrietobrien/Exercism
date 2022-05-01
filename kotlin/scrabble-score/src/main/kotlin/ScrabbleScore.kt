object ScrabbleScore {

    fun scoreLetter(c: Char): Int {
        when (c) {
            'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' -> {
                return 1
            }
            'D', 'G' -> {
                return 2
            }
            'B', 'C', 'M', 'P' -> {
                return 3
            }
            'F', 'H', 'V', 'W', 'Y' -> {
                return 4
            }
            'K' -> {
                return 5
            }
            'J', 'X' -> {
                return 8
            }
            'Q', 'Z' -> {
                return 10
            }
            else -> {
                return 0
            }
        }
    }

    fun scoreWord(word: String): Int {
        var score = 0
        for(i in 0 until word.length) {
            var w = word[i].toUpperCase()
            score += scoreLetter(w)
        }
        return score
    }
}
