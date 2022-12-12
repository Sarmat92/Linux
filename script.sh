#!/bin/bash
if [ $1 = 0 ]; then
    echo "Not a quadratic equation.";
    exit 0;
fi

D=$(( ($2)*($2)-4*($1)*($3) ));
if [ $D = 0 ]; then
    echo -n "x = "
    echo -e "scale=3\n-0.5*($2)/($1)" | bc
    exit 0;
fi

if [ $D -gt 0 ]; then
    echo -n "x1 = "
    echo -e "scale=3\n0.5*(-($2)+sqrt($D))/($1)" | bc
    echo -n "x2 = "
    echo -e "scale=3\n0.5*(-($2)-sqrt($D))/($1)" | bc
else
    echo -n "x1 = ("
    echo -e "scale=3\n-0.5*($2)/($1)" | bc
    echo -n ", "
    echo -e "scale=3\n0.5*sqrt(-($D))/($1)" | bc
    echo ")"
    echo -n "x2 = ("
    echo -e "scale=3\n-0.5*($2)/($1)" | bc
    echo -n ", "
    echo -e "scale=3\n-0.5*sqrt(-($D))/($1)" | bc
    echo ")"
fi
