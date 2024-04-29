const { app, BrowserWindow } = require('electron');

let win;

function createWindow() {
  win = new BrowserWindow({
    width: 200,
    height: 200, 
    frame: false, 
    transparent: true, 
    webPreferences: {
      nodeIntegration: true
    }
  });

  win.loadFile('index.html');

  win.setWindowShape({ rect: { x: 0, y: 0, width: 200, height: 200 }, ellipse: [{ x: 100, y: 100, radiusX: 100, radiusY: 100 }] });

  win.on('closed', () => {
    win = null;
  });
}

app.on('ready', createWindow);

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit();
  }
});

app.on('activate', () => {
  if (win === null) {
    createWindow();
  }
});
