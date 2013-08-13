In Peak Season
==========

Site which displays nicely both on desktop and mobile devices.

Site maintains database of farm produce and harvest seasons.  The system presents items which are in season based on the user's location.  The user is presented with farmers' markets nearby which are selling the items in season.  The system shows maps of these markets along with times of opperations.  The user can see which are open now, and then filter to see upcoming markets nearby.

Items in season be used to search for recipes.  A recipe API is used for this.  The recipe finder will allow the user to dynamically add and remove ingredients from a list to filter the recipe result sets.   

Vendors of produce can maintain a profile in the system.  They will mainting their name, address, picture, and roster of items they produce and sell.  The system is loose for these.  They can add items freely by name.  I need to decide how to reconcile the system's table of items, which records region and season to the vendors' particular list of items which in many cases will overlap.  The goal is to make it easy for the farmers.  They will not want to categorize thier items.  

When a user views a record for a market, it will show what items are selling there, and what vendors are selling there.  A map of its location and dates of operation will be presented as well.

When a user views a record of an item, it will show what markets it is selling at, ordered by date (now to near future)  I've found an API to show nutrictional data about food items, which I may integrate in this view as well.

When a user view a record for a vendor, it will show the name, picture, web site, etc. of the vendor.  It will show a list of what they are selling.  Things in season are prioritized.  Again, this addresses the issue of how to reconcile the system's table of items in season, to the roster of items produced by the vendor.  The view also shows what markets it is selling at, ordered by operation time (now to near future)

Roadblocks
---------

Near to integrate a login process for vendors to allow them to maintain their profile in the system.

Future featues
Shopper accounts.  This allows users to add items to a favorites/shopping list.  This list can be used to locate markets and recipes.  






