import os
info = os.statvfs('/')
diskfree = info.f_bavail * info.f_frsize
disktotal = info.f_blocks * info.f_frsize
diskpercentage = (diskfree/disktotal) * 100
print(int(diskpercentage))