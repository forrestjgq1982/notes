#include <stdio.h>
#include "keys.h"


#define ARRSZ(arr) sizeof(arr) / sizeof(arr[0])
int main(void)
{
    keymaps *pk;
    int i = 0;
    
    int alt = keys[i].a_k - keys[i].k;
    int ctrl = keys[i].c_k - keys[i].k;
    int shift = keys[i].c_s_k - keys[i].c_k;

    printf("control keys for a-z:\n\tctrl: %d(0x%04X) shift: %d(0x%04X) alt: %d(0x%04X) \n",
            ctrl, ctrl, shift, shift, alt, alt);

    pk = &keys[0];
    if(pk->c_k - pk->k == ctrl &&
       pk->a_k - pk->k == alt &&
       pk->c_a_k == pk->k + ctrl + alt &&
       pk->c_s_k == pk->k + ctrl + shift &&
       pk->c_a_s_k == pk->k + ctrl + shift + alt) 
    {

       printf("%c OK\n", pk->c);
    }
    else
    {
        printf("%c FAIL\n", pk->c);
    }
    
    i = 1;
    
    alt = keys[i].a_k - keys[i].k;
    ctrl = keys[i].c_k - keys[i].k;
    shift = keys[i].c_s_k - keys[i].c_k;
    
    int sz = ARRSZ(keys);
    int res = 1;

    printf("control keys for others:\n\tctrl: %d(0x%04X) shift: %d(0x%04X) alt: %d(0x%04X) \n",
            ctrl, ctrl, shift, shift, alt, alt);

    printf("=======================================\n");
    printf("now compare keys\n");
    printf("=======================================\n");
    for(i = 1; i < sz; i++) {
        pk = &keys[i];
        if(pk->c_k - pk->k == ctrl &&
           pk->a_k - pk->k == alt &&
           pk->c_a_k == pk->k + ctrl + alt &&
           pk->c_s_k == pk->k + ctrl + shift &&
           pk->c_a_s_k == pk->k + ctrl + shift + alt) 
        {

           printf("%c OK\n", pk->c);
        }
        else
        {
            printf("%c FAIL\n", pk->c);
        }
    }

    printf("=======================================\n");
    printf("now cap keys\n");
    printf("=======================================\n");

    int diff = 0;
    sz = ARRSZ(cap_keys);
    for(i = 1; i < sz; i++)
    {
        cap_keymaps *pck = &cap_keys[i];
        int j;
        
        char c = pck->c;
        int k = 0;
        if(c >= '0' && c <= '9')
        {
            k = c - '0';
            c = '0';
        }
        for(j = 0; j < ARRSZ(keys); j++)
        {
            if(keys[j].c == c)
            {
                k += keys[j].k;
                break;
            }
        }

        if(j == ARRSZ(keys))
        {
            printf("%c not in keys\n", pck->c);
        }
        else
        {
            if(diff == 0)
            {
                diff = pck->k - k;
                printf("cap key diff %d for %c\n", diff, pck->cap_c);
            }
            else if(diff == pck->k - k)
            {
                printf("cap diff %d match for %c\n", pck->k - k, pck->cap_c);
            }
            else
            {
                printf("cap diff %d not match for %c\n", pck->k - k, pck->cap_c);
            }
        }
    }

    printf("=======================================\n");
    printf("now function keys\n");
    printf("=======================================\n");

    func_keymaps *pfk;
    sz = ARRSZ(func_keys);
    for(i = 0; i < sz; i++) {
        pfk = &func_keys[i];
        if(pfk->c_k - pfk->k == ctrl &&
           pfk->a_k - pfk->k == alt &&
           pfk->c_a_k == pfk->k + ctrl + alt &&
           pfk->c_s_k == pfk->k + ctrl + shift &&
           pfk->c_a_s_k == pfk->k + ctrl + shift + alt) 
        {

           printf("%s OK\n", pfk->c);
        }
        else
        {
            printf("%s FAIL\n", pfk->c);
        }
    }
    
}






























































