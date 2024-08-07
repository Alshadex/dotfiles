import argparse, os
import shutil
import calendar
import pprint

def dir_path(string):
    if os.path.isdir(string):
        return string
    else:
        raise NotADirectoryError(string)
parser = argparse.ArgumentParser()
parser.add_argument('--path', type=dir_path)
args = parser.parse_args()


TARGET_DIR = '/media/adl/0153B44C33EB3164/Pictures/general'


os.chdir(args.path)

whatsappPhotos = os.listdir()

for photo in whatsappPhotos:
    nameSplit = photo.split('-')
    if len(nameSplit) == 1:
        nameSplit = photo.split('_')

    if nameSplit[0] == 'IMG' or nameSplit[0] == 'VID':
        date = nameSplit[1]
    else:
        date = nameSplit[0]

    year = date[:4]
    print(date)
    print(date[4:6])
    month_name = calendar.month_name[int(date[4:6])]
    month = f"{date[4:6].rjust(2, '0')} {month_name}"
    day = date[6:8]

    newLocation = os.path.join(TARGET_DIR, year, month, photo)
    print(newLocation)
    shutil.copy(photo, newLocation)
    