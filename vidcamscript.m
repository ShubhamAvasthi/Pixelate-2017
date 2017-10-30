vid = videoinput('winvideo', 1, 'YUY2_640x480');
src = getselectedsource(vid);

vid.FramesPerTrigger = 50;

vid.ReturnedColorspace = 'rgb';

vid.LoggingMode='memory';

preview(vid);

start(vid);
im=getsnapshot(vid);

vidcam=getdata(vid);

stop(vid);

stoppreview(vid);
