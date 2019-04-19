#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
#include <string.h>



int main()
{

int m,np,p[10]={1,2,3,4,5,6,7,8,9,10},min,k=1,btime=0;
int brst[10],temp,n,art[10],wt[10],tat[10],ta=0,sum=0;
float avg_wait=0,avg_tt=0,tsum=0,wsum=0;
printf(" -------Shortest Job First Scheduling (Non-Preemtitive )-------\n");
printf("\nEnter the No. of processes :");
scanf("%d",&np);//no of process

for(m=0;m<np;m++)
{
        
        printf("\nProcess.%d",m+1);
	
	    Y:  //applying go to statement
        printf("\nArrival-time in Sec:");
        scanf("%d",&art[m]);
	if (art[m]==0)
	{
		printf("\n Arrival time should not be zero!!!!\n Please Re-enter the correct arrival time \n");// As Burst time is twice of arrival time
		goto Y;
	}	
        brst[m]=art[m]*2;
        printf("Burst-Time:%dsec\n",brst[m]);
        printf("----------------------------------------");

}

//Sorting According to Arrival Time/

for(m=0;m<np;m++)

{
	for(n=0;n<np;n++)
	{
		if(art[m]<art[n])
		{
			temp=p[n];
			p[n]=p[m];
			p[m]=temp;
			temp=art[n];
			art[n]=art[m];
			art[m]=temp;
			temp=brst[n];
			brst[n]=brst[m];
			brst[m]=temp;
		}
	}
}



for(n=0;n<np;n++)
{
	btime=btime+brst[n];
	min=brst[k];
		for(m=k;m<np;m++)
			{
			if (btime>=art[m] && brst[m]<min)
				{
					temp=p[k];
					p[k]=p[m];
					p[m]=temp;
					temp=art[k];
					art[k]=art[m];
					art[m]=temp;
					temp=brst[k];
					brst[k]=brst[m];
					brst[m]=temp;
				}
			}
	k++;
}

wt[0]=0;
for(m=1;m<np;m++)
{
		wt[m]=0;
		for( n=0;n<m;n++)
			wt[m]+=brst[n];
		wsum+=wt[m];
}

avg_wait=(wsum/np);
	for(m=0;m<np;m++)
	{
	ta=ta+brst[m];
	tat[m]=ta-art[m];
	tsum=tsum+tat[m];
	}

avg_tt=(tsum/np);//average turn around time

printf("\n Displaying Table:-");
/*Arranging the table according to Arrival time,Burst Time, Waiting time and Turn-Around Time */
printf("\nProcess\tArrival\tBurst\tWaiting\t Turn-around" );
for(m=0;m<np;m++)
{
	printf("\n p%d\t%dsec\t %dsec\t%dsec\t%dsec",p[m],art[m],brst[m],wt[m],tat[m]);
}

printf("\n\nAverage Waiting-Time : %fsec",avg_wait);
printf("\nAverage Turn-Around-Time : %fsec\n",avg_tt);
return 0;
}
