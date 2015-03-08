using System;


public class RandomWordStream
{
	public string next(int pi, RandomStream rs)
	{
		//tworzenie ri
		int ri = rs.next();

		String rds = "";

		while(pi>0)
		{
			if( ri < 10 )
				ri = rs.next();

			int ascii = ri % 100;
			ri = ri / 100;
			rds = rds + Convert.ToChar((ascii % 67)+59);
			
			pi--;
		}

		return rds;
	}
}


public class RandomStream
{
	Random rnd = new Random();

	public int next()
	{
		return rnd.Next();
	}

	public bool eos()
	{
		return false;
	}
}


public class PrimeStream
{
	private int current = 1;

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

	public int next()
	{
		current++;
		while( !is_prime(current) )
		{
			current++;
		}
		return current;
	}

	public bool eos()
	{
		return current >= 2147483647;
	}

	public void reset()
	{
		current = 1;
	}
}







public class IntStream
{
	int current = 1;

	public int next()
	{
		current++;
		return current;
	}

	public bool eos()
	{
		return current >= 2147483647;
	}
	
	public void reset()
	{
		current = 1;
	}
}


class Test
{
	static void writeout(int a)
	{
		System.Console.WriteLine(a);
	}

	public static void Main()
	{
		System.Console.WriteLine("IntStream");
		//IntStream
		IntStream iss = new IntStream();
		writeout(iss.next());
		writeout(iss.next());
		System.Console.WriteLine(iss.eos());
		iss.reset();
		System.Console.WriteLine(iss.eos());
		writeout(iss.next());

		while( !iss.eos() )
		{
			iss.next();
		}
		System.Console.WriteLine("PrimeStream");


		//PrimeStream
		PrimeStream ps = new PrimeStream();
		for( int i = 0; i < 12; i++)
		{
			writeout(ps.next());
		}
		ps.reset();
		for( int i = 0; i < 12; i++)
		{
			writeout(ps.next());
		}
		System.Console.WriteLine("RandomStream");

		//RandomStream
		RandomStream rst = new RandomStream();
		writeout(rst.next());
		writeout(rst.next());
		writeout(rst.next());
		writeout(rst.next());

		System.Console.WriteLine("RandomWordStream");

		//RandomWordStream

		RandomWordStream rws = new RandomWordStream();
		RandomStream rs1 = new RandomStream();
		PrimeStream ps1 = new PrimeStream();

		for(int i = 0; i < 12; i++)
		{
			int prime = ps1.next();
			System.Console.WriteLine(rws.next(prime, rs1));
		}
	}
}
