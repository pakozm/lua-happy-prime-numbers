--[[
  
  Copyright (c) 2015 Francisco Zamora-Martinez (pakozm@gmail.com)
  
  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:
  
  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.
  
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
  IN THE SOFTWARE.

]]

function sqrsum(n)
  local sum = 0
  while n > 0 do
    sum=sum + (n%10)^2
    n=math.floor(n/10)
  end
  return sum
end

function isHappy(n)
  while n~=1 and n~=4 do
    n=sqrsum(n)
  end
  return n==1
end

local prime_numbers = {2,3}
function isPrime(n)
  if n == 1 then return true end
  for _,i in ipairs(prime_numbers) do
    if n==i then return true end
    if n%i == 0 then return false end
  end
  for i=prime_numbers[#prime_numbers],math.floor(n/2)+1,2 do
    if n%i == 0 then return false end
  end
  if n > prime_numbers[#prime_numbers] then
    table.insert(prime_numbers, n)
  end
  return true
end

local a=tonumber(arg[1]) or 1
local b=tonumber(arg[2]) or a+500
local c=tonumber(arg[3]) or 1
for n=a,b,c do if isHappy(n) and isPrime(n) then print(n) end end
