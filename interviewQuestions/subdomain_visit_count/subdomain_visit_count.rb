<<-WORKING_WITH_THE_PROBLEM
"9001 discuss.leetcode.com"

{
  "discuss.leetcode.com" => 9001,
  "leetcode.com" => 9001
  "com" => 9001
}

["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"]

{
  "google.mail.com" => 900,
  "mail.com" => 900,
  "com" => 900,
}
WORKING_WITH_THE_PROBLEM

# TIME TAKEN ~= 60 minutes

def create_domains(split_cp_domain)
  # EXPECTATION:
  # # ["com", "com", "com"]
  # # ["com", "leetcode.com", "leetcode.com"]
  names_collection = [] # ["com", "leetcode.com", "discuss.leetcode.com"]
  i = 0
  aggregate_dp_dom = ""
  while (i < split_cp_domain.length) do
    current_dp_dom = split_cp_domain[split_cp_domain.length - (i + 1)] # com
    if (aggregate_dp_dom == "")
      aggregate_dp_dom = current_dp_dom # com
    else
      aggregate_dp_dom = "#{current_dp_dom}.#{aggregate_dp_dom}" # leetcode.com
    end
    names_collection[i] = aggregate_dp_dom
    i += 1
  end
  names_collection
end

def subdomain_visit_count(count_paired_cpdomains)
  # {
  #   "com" => 9001,
  #   "leetcode.com" => 9001,
  #   "discuss.leetcode.com" => 9001
  # }
  visit_counter = {}
  count_paired_cpdomains.each do |count_paired_cpdomain|
    count,cp_domain = count_paired_cpdomain.split(" ") # ["9001", discuss.leetcode.com]
    split_cp_domain = cp_domain.split(".") # ["discuss", "leetcode", "com"]

    create_domains(split_cp_domain).each do |domain| # ["com", "leetcode.com", "discuss.leetcode.com"]
      int_count = count.to_i
      if visit_counter.has_key?(domain)
        visit_counter[domain] = visit_counter[domain] + int_count
      else
        visit_counter[domain] = int_count
      end
    end
  end
  formatted_visit_count = visit_counter.map do |key, value|
    "#{value} #{key}"
  end
  return formatted_visit_count
end

p subdomain_visit_count(["9001 discuss.leetcode.com"]) == ["9001 com", "9001 leetcode.com", "9001 discuss.leetcode.com"]
p subdomain_visit_count(["900 google.mail.com", "50 yahoo.com"]) == ["950 com", "900 mail.com", "900 google.mail.com", "50 yahoo.com"]
p subdomain_visit_count(["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"]) == ["951 com", "901 mail.com", "900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 org", "5 wiki.org"]

# NOTE: Odd that it's using an array when the order does not seem to matter
# QUESTION: What is the time complexity of a split...?
