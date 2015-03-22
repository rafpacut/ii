using System;
using System.Collections;

class Primes: IEnumerator
{
	private int position = 1;	


	private bool is_prime(int a)
	{
		for(int i = 2; i < a; i++)
		{
			if( a % i == 0)
				return false;
		}
		return true;
	}

	public bool MoveNext()
	{
		this.position++;
		while(!is_prime(this.position))
		{
			this.position++;
		}
		return this.position < 2147483647;
	}

	public object Current
	{
		get
		{
			return this;
		}
	}

	public void Reset()
	{
		this.position = 1;
	}

	public override string ToString()
	{
		string str = "";
		str += this.position;
		return str;
	}

}



class PrimeCollection: IEnumerable
{
	public IEnumerator GetEnumerator()
	{
		return new Primes();
	}
}


class Program
{
	public static void Main()
	{
		PrimeCollection pc = new PrimeCollection();
		foreach(Primes p in pc)
			Console.WriteLine(p);
	}
}
