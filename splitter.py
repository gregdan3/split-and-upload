#!/usr/bin/env python3
from moviepy.video.io.ffmpeg_tools import ffmpeg_extract_subclip

INPUT = "thebeemovie.mp4"
OUTPUT = "out/The Bee Movie But Split Into Four Second Segments Part %s.mp4"
SECONDS_IN_MOVIE = (90 * 60) + 40


def main():
    segment = 3.95
    start = 0
    end = start + segment
    for i in range(0, int(SECONDS_IN_MOVIE / segment) + 3):
        print("Extracting part %s" % i)
        ffmpeg_extract_subclip(INPUT, start, end, targetname=OUTPUT % f"{i+1}")
        start += segment
        end += segment


if __name__ == "__main__":
    main()
