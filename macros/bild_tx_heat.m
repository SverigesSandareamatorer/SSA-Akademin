#
# This is a GNU Octave file.
#

hf = figure();

x = 0:0.03:1;
v = x*360;
uut = 5*sin(x*2*pi);
ut = 6-uut;
il = ut/10;
it = 1.2-il;
pt = ut .* it;

plot(v, ut, "-k;$U_{ce}$;", v, pt, ".k;$P_t$;");


xlabel("Angle (degrees)");
ylabel ("Voltage (V) and Power (W)");

file_path = fileparts(mfilename('fullpath'))

file_name = [file_path  "/" "bild_tx_heat.pdf"]

# print ("-deps", file_name);
print (hf, file_name, "-dpdflatexstandalone");