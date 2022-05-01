import java.time.LocalDateTime
import java.time.LocalDate

class Gigasecond (val ldt: LocalDateTime){
    constructor(ldt: LocalDate) : this(ldt.atStartOfDay())
    private val gs = 1_000_000_000
    val date: LocalDateTime = ldt.plusSeconds(gs.toLong())
}
