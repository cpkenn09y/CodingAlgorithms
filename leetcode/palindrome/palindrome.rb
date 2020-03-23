# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  def check_outer(str,index=0)
    if str.length == 1 || str.length == 0
      return true
    end
    if str[index] == str[str.length - (index+1)]
      puts "#{str[index]} matches #{str[str.length - (index+1)]}"
      sub_str = str.slice(1,str.length-2)
      check_outer(str,index+1)
    else
      return false
    end
  end
  cleaned_string = s.delete(" ").downcase.delete(",").delete(":") # "amanaplanacanalpanama"
  return check_outer(cleaned_string)
end

puts is_palindrome("a") == true
puts is_palindrome("aba") == true
# puts is_palindrome("A man, a plan, a canal: Panama") == true
# puts is_palindrome("race a car") == false
