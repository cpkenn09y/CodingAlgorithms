def singleNumber(nums) {
  seenOnce = 0
  seenTwice = 0;

  for (int num : nums) {
    # first appearence:
    # add num to seen_once
    # don't add to seen_twice because of presence in seen_once

    # second appearance:
    # remove num from seen_once
    # add num to seen_twice

    # third appearance:
    # don't add to seen_once because of presence in seen_twice
    # remove num from seen_twice
    seenOnce = ~seenTwice & (seenOnce ^ num);
    seenTwice = ~seenOnce & (seenTwice ^ num);
  }

  return seenOnce;
}

p single_number([2,2,3,2]) == 3
# p single_number([0,1,0,1,0,1,99]) == 99
