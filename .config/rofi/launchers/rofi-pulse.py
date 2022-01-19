#!/usr/bin/env python3

# Uses libraries python-rofi and pulsectl

from rofi import Rofi
import pulsectl
import sys


def main():
    pulse = pulsectl.Pulse()
    rofi = Rofi(rofi_args=[f"-theme ${sys.argv[0]}"])
    card = pulse.card_list()[0]

    profiles = card.profile_list

    profile_index, _ = rofi.select("Select profile", [
        p.description for p in profiles], select=0)
    if profile_index == -1:
        return

    pulse.card_profile_set(card, profiles[profile_index])


if __name__ == '__main__':
    main()
