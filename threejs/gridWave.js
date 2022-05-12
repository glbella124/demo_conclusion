var scene = new THREE.Scene();

var W = window.innerWidth;
var H = window.innerHeight;

var renderer = new THREE.WebGLRenderer();
renderer.setClearColor(0x17293a);
renderer.setSize(W, H);

var camera = new THREE.PerspectiveCamera(45, W / H, 0.01, 10000);

var planeGeometry = new THREE.PlaneGeometry(100, 100, 20, 20);
var planeMaterial = new THREE.MeshBasicMaterial({
    color: 0xffffff,
    wireframe: true
});
var plane = new THREE.Mesh(planeGeometry, planeMaterial);

plane.rotation.x = -0.5 * Math.PI;

plane.position.set(0, 0, 0);

scene.add(plane);

camera.position.set(0, 90, 120);
camera.lookAt(scene.position);

document.body.appendChild(renderer.domElement);

(function drawFrame(ts) {
    window.requestAnimationFrame(drawFrame);
    var vLength = plane.geometry.vertices.length;
    for (var i = 0; i < vLength; i++) {
        var v = plane.geometry.vertices[i];
        v.z = Math.sin(ts / 500 + (v.x * (vLength / 2)) * (v.y / (vLength / 2))) * 3 + 5;
    }
    plane.geometry.verticesNeedUpdate = true;
    renderer.render(scene, camera);
}());