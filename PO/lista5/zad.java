class Wyrazenie
{
	Wyrazenie left;
	Wyrazenie right;

	public int oblicz()
	{
		return -1;
	}
}

class Leaf extends Wyrazenie
{
	int x;

	public Leaf(int x)
	{
		this.x = x;
	}

	public int oblicz()
	{
		return x;
	}

	public String toString()
	{
		String str = "";
		str += this.x;
		return str;
	}
}


class Add extends Wyrazenie
{
	public Add(Wyrazenie left, Wyrazenie right)
	{
		this.left = left;
		this.right = right;
	}

	public int oblicz()
	{
		return this.left.oblicz() + this.right.oblicz();
	}

	public String toString()
	{
		return "(" + this.left.toString() + "+" + this.right.toString() + ")";
	}
}


class Multiply extends Wyrazenie
{
	public Multiply(Wyrazenie left, Wyrazenie right)
	{
		this.left = left;
		this.right = right;
	}

	public int oblicz()
	{
		return this.left.oblicz() *	 this.right.oblicz();
	}

	public String toString()
	{
		return "(" + this.left.toString() + "*" + this.right.toString() + ")";
	}
}



class Program
{
	public static void main(String [] args)
	{
		int y = 12;
		int x = 11;
		Wyrazenie expr = new Add(new Multiply(new Leaf(7),new Add(new Leaf(y),new Leaf(x))),new Leaf(17));
		System.out.println(expr);
		System.out.println(expr.oblicz());

	}
}
			
