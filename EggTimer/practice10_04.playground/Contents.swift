func calculator()
{
    let num = Int.random(in: 0...100)
    if num == 100
    {
        print("YUP")
    }
    else
    {
        print("NO>")
    }
}
//Don't change this
var aYear =  2020
isLeap(year:aYear)
func isLeap(year: Int)
{
  if ((year%4 == 0) && (year%100 != 0)) || (year%400 == 0)
  {
      print("YES")
  }
  else
  {
      print("NO")
  }
  //Write your code inside this function.
}

