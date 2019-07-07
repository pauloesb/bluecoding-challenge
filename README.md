# Blue Coding Challenge - URL Shortener

## Solution developed in Ruby - 2.6.3

## Solution Deployed At
- **https://bcshort.herokuapp.com**

## Requirements
- Make sure you have ruby version 2.6.3 installed
- Make sure you have Postgresql installed
- Make sure you have Redis installed
- Set these env in your machine
-- export PORT=3000 (Or another free port if 3000 is in use)

-- export RAILS_ENV=production (Or development if you want to test in dev environment)

## Running the solution:
- First execute 'bundle' to install the referent gems
- After that you need to create the database for that you execute the following commands:
--  rails db:create
--  rails db:migrate
- To run the server and sidekiq execute the following command:
--   foreman start
- **OPTIONAL:**
-- If you want to include dummy data execute
-- rails db:seed

## Running the tests: 
- To run the test suit just type the following command:
-- rspec (To Run Unitary and Functional tests)
-- cucumber (To run End-to-End test BDD)

## Technical Information:
### Generate Short Url Algorithm
```ruby
    def generate_short_url
        LengthUrl.increase if Url.count > 62**LengthUrl.size
        size_url = LengthUrl.size
        chars = ['A'..'Z','a'..'z','0'..'9'].map{|x| x.to_a}.flatten
        self.short_url = size_url.times.map{chars.sample}.join
        Url.find_by_short_url(self.short_url) && (self.short_url = size_url.times.map{chars.sample}.join)
    end
```
- The objective it was to generate the shortest urls to the original urls so for this we consider that the minimum size is 1 and the maximum is infine. 
- So for this I have created a model called **LengthUrL** with only one attribute called **size** where by default it is initialized with 1 when created a record for the table. 
- This table will be responsible to control the size of the shorten url's. The shorten urls can have in their composition the following strings ['A'..'Z','a'..'z','0'..'9'] so by initializing this array then flattening I have all the possible one characters in total of 62 that can be composed my shorten url.
- Whis this I can shorten a total of 62 urls with the smallest number set by LengthUrl.size that's 1, after all possibilities have been exhausted the algorithm will increase size by one, so we will have a total of 62**2 (Total of 3.844) possibilities to chose a 2 chars for the smallest url, and that goes on. 
- I sample the array of all chars possible times the size that was set and I join them in the end by forming the shortest url.
- I run this shortest url to see if it's unique, if not I resample it again until I have an unique short_url, and then with this unique I save it on my database.


## Author
- Paulo Eduardo Souza Borba
- pauloesb@gmail.com
