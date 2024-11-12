set terminal png size 300,400
set output 'w_vs_h.png'
set datafile separator comma
plot '/home/users/datasets/hotels.csv' using 12:18 title 'cleanliness vs. overall_ratingsource' with points

f(x) = m*x+b
fit [x=0:*] f(x) '/home/users/datasets/hotels.csv' using 12:(($18 == -1)? NaN:$18) via m,b
set output 'w_vs_h_fit.png'
plot '/home/users/datasets/hotels.csv' using 12:18 title 'cleanliness vs. overall_ratingsource' with points, f(x) title 'fit'
