#' Sets par parameters
#' 
#' Set more sensible par parameters
#' @param mar Distance to edge
#' @param mgp Distance from label to graph
#' @param tck tick length
#' @param cex.axis Axis text size
#' @param las Rotate axis label
#' @param mfrow plots per page
#' @param ... Additional arguments for par
#' @seealso par
#' @export
#' @importFrom graphics par
setnicepar = function(mar=c(3,3,2,1), 
         mgp=c(2,0.4,0), tck=-.01,
         cex.axis=0.9, las=1, mfrow=c(1,1),...) {
  par(mar=mar, 
      mgp=mgp, tck=tck,
      cex.axis=cex.axis, las=las,mfrow=mfrow,...)
}
