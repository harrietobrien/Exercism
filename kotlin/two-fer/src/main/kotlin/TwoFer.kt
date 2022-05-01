internal fun twofer(name: String? = null): String {
    var n : String = ""
    n = name ?: "you"
    return "One for $n, one for me."
}
