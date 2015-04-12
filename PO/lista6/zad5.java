import java.util.Arrays;



class ThreadMergeSort extends Thread
{
	int [] arrayToBeSorted;
	int [] sortedarray;

	public int[] getSortedArray()
	{
		return this.sortedarray;
	}


	ThreadMergeSort(int[] array)
	{
		this.arrayToBeSorted = array;

		this.sortedarray = this.divideAndMerge();
	}

	int[] divideAndMerge()
	{
		int mid = this.arrayToBeSorted.length/2;

		if( this.arrayToBeSorted.length > 1)
		{
			int[] leftarray = Arrays.copyOfRange(this.arrayToBeSorted, 0, mid);
			int[] rightarray = Arrays.copyOfRange(this.arrayToBeSorted, mid, this.arrayToBeSorted.length);

			ThreadMergeSort leftsort = new ThreadMergeSort(leftarray);
			ThreadMergeSort rightsort = new ThreadMergeSort(rightarray);

			leftsort.start();
			rightsort.start();
			try
			{
				leftsort.join();
				rightsort.join();
			}
			catch(InterruptedException e)
			{
				System.out.println(e);
			}
			leftarray = leftsort.getSortedArray();
			rightarray = rightsort.getSortedArray();

			int [] merged = merge(leftarray, rightarray);
			
			return merged;
		}
		else
			return this.arrayToBeSorted;

	}

	public int[] merge(int[] a, int[] b)
	{

		int[] merged = new int[a.length + b.length];

		int i = 0;
		int j = 0;
		int k = 0;
		while( i <= a.length - 1 && j <= b.length -1 )
		{
			if(a[i] < b[j])
			{
				merged[k] = a[i];
				i++;
			}
			else
			{
				merged[k] = b[j];
				j++;
			}
			k++;
		}
		while( i != a.length )
		{
			merged[k] = a[i];
			i++;
			k++;
		}

		while( j != b.length )
		{
			merged[k] = b[j];
			j++;
			k++;
		}
		return merged;
	}

	public void printarray()
	{
		for(int i = 0; i < this.sortedarray.length; i++)
			System.out.println(this.sortedarray[i]);
	}

}



class Program
{
	public static void main(String[] args)
	{
		int [] array = {33,21,19,17,11,8,5,3,2,1};
		ThreadMergeSort sort = new ThreadMergeSort(array);
		sort.printarray();

	}
}





















