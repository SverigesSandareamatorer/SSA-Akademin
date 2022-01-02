#
# This is a GNU Octave file.
#
x = 0:0.03:1;
v = x*360;
uut = 5*sin(x*2*pi);
ut = 6-uut;
it = 2.5*sin(x*2*pi);
pt = abs(ut.*it);
plot(v, uut, "-k;U_{ut};", v, ut, ".k;U_t;", v, it, "+k;I_t;", v, pt, "--k;P_t;");
xlabel("Vinkel (grader)");
ylabel("Spänning, ström, effekt");

file_path = fileparts(mfilename('fullpath'))

file_name = [file_path  "/" "bild_tx_heat.eps"]

# print -dpdf file_name
print ("-deps", file_name);
