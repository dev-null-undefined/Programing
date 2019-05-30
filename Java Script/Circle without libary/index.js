let ctx;
let c;
function onLoad() {
  c = document.getElementById("myCanvas");
  ctx = c.getContext("2d");
  ctx.moveTo(0, 0);
  for (let i = 0; i < 360 * 2; i++) {
    drawPixel(
      Math.sin(i / 2.0) * 50 + c.width / 2,
      Math.cos(i / 2.0) * 50 + c.height / 2,
      ctx
    );
  }
  ctx.beginPath();
  ctx.arc(c.width / 2, c.height / 2, 55, 0, 2 * Math.PI);
  ctx.stroke();
}
function drawPixel(x, y, ctx) {
  ctx.fillRect(x, y, 1, 1);
}
window.onload = onLoad;
