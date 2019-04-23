#!/bin/sh
python3 sources/BUILD.py \
    --ttfautohint "-v --stem-width-mode=qsq" \
    --googlefonts ~/Google/fonts/ofl/lemonada \
#    --static
#    --fontbakery \
#    --drawbot \
#    --addfont \
#    --fixnonhinting
