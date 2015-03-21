using System;


class MatrixVertex
{
	string value;
	public int number;
	public MatrixGraph graph;

	void set_neighbour( MatrixVertex vert )
	{
		graph.adj_matrix[vert.number][this.number] = true;
		graph.adj_matrix[this.number][vert.number] = true;	
	}

	void del()
	{
		for(int i = 0; i < this.number; i++)
		{
			graph.adj_matrix[i][this.number] = false;
			graph.adj_matrix[this.number][i] = false;
		}
	}

	public void set_value(string val)
	{
		this.value = val;
	}
}


class MatrixGraph
{
	public bool[] [] adj_matrix;
	public MatrixVertex [] mv;
	int size;

	public void generate_random( int vertices, int edges )
	{
		this.size = vertices;
		
		this.mv = new MatrixVertex[vertices];
		for( int i = 0; i < vertices; i++)
		{
			mv[i] = new MatrixVertex();
			mv[i].number = i;
			mv[i].graph = this;
		}



		this.adj_matrix = new bool[vertices][];
		for(int i = 0; i < vertices; i++)
			this.adj_matrix[i] = new bool[vertices];

		for(int i = 0; i < vertices; i++)
		{
			for(int j = 0; j < vertices; j++)
			{
				this.adj_matrix[i][j] = false;
			}
		}

		Random rnd = new Random();
		for(int i = 0; i < edges; i++)
		{
			int x_coeff = rnd.Next(0, vertices);
			int y_coeff = rnd.Next(0, vertices);
		
			this.adj_matrix[x_coeff][y_coeff] = true;
			this.adj_matrix[y_coeff][x_coeff] = true;

		}
	}

	public override string ToString()
	{
		string str = "";
		for(int i = 0; i < this.size;i++)
		{
			str += "vertex number: " + i + " has neighbours: \n";
			for(int j = 0; j < this.size;j++)
			{
				if( this.adj_matrix[i][j] && i != j )
					str += j + "\n";
			}
		}
		return str;
	}
}



class Program
{
	public static void Main()
	{
		MatrixGraph mg  = new MatrixGraph();
		mg.generate_random(5,3);
		Console.WriteLine(mg);

	}
}













