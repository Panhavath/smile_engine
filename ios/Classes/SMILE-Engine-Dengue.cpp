//
// Created by MIRU_Dengue on 2/1/2023.
//
#include "smile_license.h"
#include "smile.h"
#include <cstdio>
#include <iostream>
#include <string>
//#include "../s"

extern "C" {
double get_prediction_result ()//you also need to provide a return type for your main function
{
    // load the network created by Tutorial1
    DSL_network net;
    int res = net.ReadFile("DHF_bayesianNetwork_day1.xdsl");
    if (DSL_OKAY != res)
    {
        printf("Network load failed,\n");
    }
    printf("Posteriors with no evidence set:\n");
    return 0;
}

}