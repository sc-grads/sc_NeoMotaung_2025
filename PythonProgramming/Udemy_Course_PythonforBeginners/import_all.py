from my_time import *
from time import *

#importing everything using * can come with some issues
#It can "override" certain functions from other modules
#If there are large modules like math it is more acceptable to use *
#* is really better for use for smaller scale development, not for larger more professional settings

print(date())
print(time())
