#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
using namespace std;

char MyCmd[1000];
int x, ctl;

void usage()
{
    cout << "********************************" << endl;
    cout << "           定时关机程序         " << endl;
    cout << "********************************" << endl;
    cout << endl;
    cout << "1  >>>>>>>> 设置关机时间" << endl;
    cout << "0  >>>>>>>> 取消关机" << endl;
}

void shut()
{
    cin >> ctl;
    if(ctl == 1)
    {
        cout << "请键入延时时间（单位：分钟）" << endl;
        cin >> x;
        x *= 60;
        sprintf(MyCmd, "shutdown -s -t %d", x);
        system(MyCmd);
    }
    else if(ctl == 0)
    {
        system("shutdown -a");
    }
}

int main()
{
    usage();    /*使用方法*/
    shut();     /*实际程序*/
    return 0;
}
