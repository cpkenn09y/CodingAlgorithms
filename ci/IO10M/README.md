We have a number of items in stock to make sure
we can keep our patients happy and healthy.
In our lab, our items degrade in quality as they approach their expiration
date. In order to keep track of this, we have a service that updates our
inventory for us. This was built by one of our past employees a few years back
and is beginning to look dusty.
Basic Parameters for all items:
  - All items have a use_in value, which denotes the number of days we have to
  use the item before the expiration date
  - All items have a quality value, which is never negative and never greater
  than 50
Daily updates for normal items:
  - The use_in and quality values decrease by 1
  - Once the expiration date has passed, the quality value decreases twice as
  fast
Daily updates for special items:
  - For "Thermometer" items, since they are nonperishable, the quality and
  use_in value are not changed
  - For "BacterialCulture" items, the use_in value decreases by 1, while the
  quality value increases by 1.  If the bacterial culture item has expired,
  then the quality increases twice as fast.
  - For "FluVaccine" items, the use_in value decreases by 1, and the quality
  value is updated according to the following rules:
      - Quality increases by 1 when there are more than 10 days before
      expiration
      - Quality increases by 2 when there are 6 to 10 days before expiration
      - Quality increases by 3 when there are 5 days or fewer before expiration
      - Quality drops to 0 when the flu vaccine has expired
We have recently decided to stock a number of refrigerated medications. This
requires an update to our system, as we sometimes have power outages.
NEW functionality - Daily updates for refrigerated items:
  - During a power outage, refrigerated normal items decrease in quality twice
  as fast as non-refrigerated items
  - The quality of a refrigerated “BacterialCulture” does not increase.  If
  there is a power outage, the quality of the refrigerated bacterial culture
  increases by 1 if it has not expired, and by 2 if it has expired.
The new updating functionality applies only to refrigerated items.
Non-refrigerated items should continue being updated as before.
In order to add these new features, feel free to make any changes to the
update_quality method and add any new code. However, please do not alter the
Item class. This class is owned by a different team and is used in many places.
Keep in mind that your team will eventually have to add more
functionality to this, therefore refactoring for readability is important.
