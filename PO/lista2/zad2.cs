using System.Collections.Generic;
using System;


public class LazyList
{
	protected List<int> list = new List<int>();
	
	public virtual int element(int index)
	{
		if(index >= 0)
		{
			if(index >= this.size())
			{
				int number = this.size();
				for(; number <= index; number++)
					this.list.Add(number);

			}
			return list[index];
		}
		else 
			return -1;
	}

	public int size()
	{
		return this.list.Count;
	}
}


public class Primes : LazyList
{
	private bool is_prime(int a)
	{
		int limit = Convert.ToInt32(Math.Sqrt(a));
		
		for(int i = 2; i <= limit; i++)
		{
			if( a % i == 0)
				return false;
		}
		return true;
	}



	public override int element(int index)
	{
		if(index >= 0)
		{
			if(index >= this.size())
			{
				int number = this.size();
				while( number != index )
				{

					int candidate = (number==0)? 3 : list[number-1]+1;
					while(!is_prime(candidate))
					{
						candidate++;
					}
					list.Add(candidate);
					number++;
				}
			}
			return list[index-1];
		}
		else
			return -1;
	}
}	

public class Program
{
	public static void Main()
	{
		//System.Console.WriteLine("haha.");
		LazyList ll = new LazyList();
		System.Console.WriteLine(ll.size());
		System.Console.WriteLine(ll.element(40));
		System.Console.WriteLine(ll.size());
		System.Console.WriteLine(ll.element(38));
		System.Console.WriteLine(ll.size());

		System.Console.WriteLine("NOW PRIMES");
		Primes primes = new Primes();

		for(int i = 12; i < 20; i++)
		{
			System.Console.WriteLine(primes.element(i));
			System.Console.WriteLine(primes.size());
		}


	}
}
