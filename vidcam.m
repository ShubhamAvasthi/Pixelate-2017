function [im]=vidcam()
vid = videoinput('winvideo', 2, 'MJPG_1280x960');
src = getselectedsource(vid);

vid.FramesPerTrigger = 1;

src.Brightness = 28;

src.Saturation = 78;

preview(vid);

start(vid);

im=getsnapshot(vid);
im=imrotate(im,-90);
end