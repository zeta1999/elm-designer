all: dev

dev: build
	npm run electron &
	npm run main:watch

build:
	npm run build

clean: 
	rm -fR dist
	rm -fR build

run: build
	npm run electron

package-mac: clean build icon
	electron-builder -m

icon: 
	mkdir dist/electron.iconset
	sips -z 16 16 assets/icon.png --out dist/electron.iconset/icon_16x16.png
	sips -z 32 32 assets/icon.png --out dist/electron.iconset/icon_16x16@2x.png
	sips -z 32 32 assets/icon.png --out dist/electron.iconset/icon_32x32.png
	sips -z 64 64 assets/icon.png --out dist/electron.iconset/icon_32x32@2x.png
	sips -z 128 128 assets/icon.png --out dist/electron.iconset/icon_128x128.png
	sips -z 256 256 assets/icon.png --out dist/electron.iconset/icon_128x128@2x.png
	sips -z 256 256 assets/icon.png --out dist/electron.iconset/icon_256x256.png
	sips -z 512 512 assets/icon.png --out dist/electron.iconset/icon_256x256@2x.png
	sips -z 512 512 assets/icon.png --out dist/electron.iconset/icon_512x512.png
	cp assets/icon.png dist/electron.iconset/icon_512x512@2x.png
	iconutil -c icns --output dist/app.icns dist/electron.iconset
	rm -r dist/electron.iconset