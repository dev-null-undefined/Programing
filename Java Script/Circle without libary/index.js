function onLoad() {
  var c = document.getElementById("myCanvas");
  var ctx = c.getContext("2d");
  ctx.moveTo(0, 0);
  ctx.stroke();
  for (let i = 0; i < 360; i++) {
    ctx.fillRect(Math.sin(i) * 50+c.width/2, Math.cos(i) * 50+c.height/2, 1, 1);
  }
}
window.onload = onLoad;
