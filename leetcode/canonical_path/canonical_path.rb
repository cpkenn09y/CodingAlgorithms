# @param {String} path
# @return {String}
def simplify_path(path)
  stack = []
  path.split("/").each do |command| #=> ["", "home"]
    case command
    when "", "."
    when ".."
      stack.pop
      # puts "popped stack"
    else
      stack << command
      # puts "add #{command} onto stack"
    end
  end
  "/" + stack.join("/")
end

<<-TEST_CASES
  # no trailing slashes
  p simplify_path("/home/") == "/home"
  # <<-SANDBOX
  #   # IF trailing slash, then remove
  # SANDBOX

  # # cannot go above '/'
  p simplify_path("/../") == "/"

  # # remove consecutive slashes
  p simplify_path("/home//foo/") == "/home/foo"

  # # went down '/a/b' however went back up two levels, then down to 'c'
  p simplify_path("/a/./b/../../c/") == "/c"
  # <<-SANDBOX
  #   ['a', ".", "b", "..", "..", "c"]
  #   ["c"]
  # SANDBOX

  # # move around in folders
  p simplify_path("/a/../../b/../c//.//") == "/c"
  # <<-SANDBOX
  #   ['a', "..", "..", "b", "..", "c","", ".", ""]
  #   ["c"]
  # SANDBOX
TEST_CASES
