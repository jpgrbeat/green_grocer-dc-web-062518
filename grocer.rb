require 'pry'
def consolidate_cart(cart)
  cart.each_with_object({}) do |item, final| 
    item.each do |key, attributes|
      #binding.pry
      if final[key]
        attributes[:count] += 1
      else
        attributes[:count] = 1
        final[key] = attributes
      end
    end
  end
end

def apply_coupons(cart, coupons)
  new_cart = {}
    cart.each do |key, values|
      coupons.each do |coupon|
        if coupon[:item] == key && values[:count] >= coupon[:num] 
            #puts "applying coupon now"
            #creates a new hash where the value of cart items has changed based on what coupons matched items.New cart includes applied coupon.
              # key = "#{key} W/COUPON"
              # values[:count] = 1
              # values[:price] = coupon[:cost] 
              
              values[:count] - coupons[:num]
              binding.pry
              if new_cart["#{key} W/COUPONS"]
                new_cart["#{key} W/COUPONS"][:count] += 1
                binding.pry
              else
                new_cart["#{key} W/COUPON"] = {:price => coupons[:cost], :clearance => values[:clearance], :count => 1}
                binding.pry
              end
                
            end
          end
        new_cart[key] = values
  end
end

def apply_clearance(cart)
  # code here
  cart.each do |key,value|
    if value[:clearance] == true
      value[:price] = (value[:price]* 0.8).round(2)
    end
  end
end

def checkout(cart, coupons)
  # code here
  
end
