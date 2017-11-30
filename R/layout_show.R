#' Show complex layouts
#' 
#' Tweak to \code{layout.show} to allow text size to be displayed.
#' @param n number of figures to plot.
#' @param cex text size
#' @param text Text to print
#' @importFrom graphics box plot.new text
#' @export
layout_show = function (n = 1, cex=1, text = NULL) 
{
  if(is.null(text)) text = paste0("Chart ", seq_len(n))
  oma.saved <- par("oma")
  par(oma = rep.int(0, 4))
  par(oma = oma.saved)
  o.par <- par(mar = rep.int(0, 4))
  on.exit(par(o.par))
  for (i in seq_len(n)) {
    plot.new()
    box()
    text(0.5, 0.5, text[i], cex = cex)
  }
  invisible()
}