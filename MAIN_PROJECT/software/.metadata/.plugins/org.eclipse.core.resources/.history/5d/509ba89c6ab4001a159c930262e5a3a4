#include "sys/alt_stdio.h"
#include "terasic/terasic_includes.h"
#include "terasic/FatFileSystem.h"
#include "altera_avalon_pio_regs.h"
#include "stdio.h"

/****
 * VARIABLES
 */
uint R, G, B;
int SWITCHES;

short int sd_fileh;
char buffer[512] = "WELCOME TO THE INTERFACE!!\r\n\0";

/**
 * SOBEL OPERATORS
 */
int sobel_h[3][3] = {{-1, -2, -1}, {0, 0, 0}, {1, 2, 1}}; //Horizontal
int sobel_v[3][3] = {{-1, 0, 1}, {-2, 0, 2}, {-1, 0, 1}}; //Vertical

/***
 * FUNCTIONS TO USE
 */
void redFilter(uint *G, uint *B){
	*G = 0;
	*B = 0;
	return;
}

void greenFilter(uint *R, uint *B){
	*R = 0;
	*B = 0;
	return;
}

void blueFilter(uint *R, uint *G){
	*R = 0;
	*G = 0;
	return;
}

void grayScale(uint *R, uint *G, uint *B){
	/**
	 * GRAYSCALE is calculated by forming a weighted sum of the Red, Green, and Blue colour and dividing it by 3
	 * This value then replaces the old RGB value;	 *
	 */
	// Calculating Average Gray
	*R = *G = *B = (*R + *B + *G) / 3;

	/* Calculating by Luminosity */
//	*R = 0.2989 * *R;
//  *G = 0.5870 * *G;
//	*B = 0.1140 * *B;
	return;
}

void Sobel(int image[640][480], int out[640][480]){
	int r, c, j, i, accx, accy;
	int ox[640][480];
	int oy[640][480];
	for (r = 0; r < 640; r++){
		for(c = 0; c< 480; c++){
			accx = 0;
			accy = 0;
			for (j=0; j< 3; j++){
				for(i = 0; i < 3; i++){
					accx += sobel_h[j][i] * image[r + (j-1)][c + (i-1)];
					accy += sobel_v[j][i] * image[r + (j-1)][c + (i-1)];
				}
			}
			ox[r][c] = accx;
			oy[r][c] = accy;
		}
	}

	/**
	 * Calculate the gradient for all pixels and place them in the array
	 */
	for(r = 0; r < 640; r++){
		for(c = 0; c < 480; c++){
//			out[r][c] = sqrt(pow(ox[r][c], 2) + pow(oy[r][c], 2));
		}
	}

	return;
}

/**
 * sd kaart bende
 */
//test if partition on sd card is fat and readable

bool Fat_Test(FAT_HANDLE hFat, char *pDumpFile){
    bool bSuccess;
    int nCount = 0;
    FAT_BROWSE_HANDLE hBrowse;
    FILE_CONTEXT FileContext;

    //get files stored on the sd card
    bSuccess = Fat_FileBrowseBegin(hFat, &hBrowse);
    if (bSuccess){
        while(Fat_FileBrowseNext(&hBrowse, &FileContext)){
            if (FileContext.bLongFilename){
                alt_u16 *pData16;
                alt_u8 *pData8;
                pData16 = (alt_u16 *)FileContext.szName;
                pData8 = FileContext.szName;
                printf("[%d]", nCount);
                while(*pData16){
                    if (*pData8)
                        printf("%c", *pData8);
                    pData8++;
                    if (*pData8)
                        printf("%c", *pData8);
                    pData8++;
                    pData16++;
                }
                printf("\n");
            }else{
                printf("[%d]%s\n", nCount, FileContext.szName);
            }
            nCount++;
        }
    }

    //read and dump contents of file
    if (bSuccess && pDumpFile && strlen(pDumpFile)){
        FAT_FILE_HANDLE hFile;
        hFile =  Fat_FileOpen(hFat, pDumpFile);
        if (hFile){
            char szRead[256];
            int nReadSize, nFileSize, nTotalReadSize=0;
            nFileSize = Fat_FileSize(hFile);
            if (nReadSize > sizeof(szRead))
                nReadSize = sizeof(szRead);
            printf("%s dump:\n", pDumpFile);
            while(bSuccess && nTotalReadSize < nFileSize){
                nReadSize = sizeof(szRead);
                if (nReadSize > (nFileSize - nTotalReadSize))
                    nReadSize = (nFileSize - nTotalReadSize);
                //
                if (Fat_FileRead(hFile, szRead, nReadSize)){
                    int i;
                    for(i=0;i<nReadSize;i++){
                        printf("%c", szRead[i]);
                    }
                    nTotalReadSize += nReadSize;
                }else{
                    bSuccess = FALSE;
                    printf("\nFaied to read the file \"%s\"\n", pDumpFile);
                }
            } // while
            if (bSuccess)
                printf("\n");
            Fat_FileClose(hFile);
        }else{
            bSuccess = FALSE;
            printf("bruh moment", pDumpFile);
        }
    }

    return bSuccess;
}


int main()
{
    FAT_HANDLE hFat;

    while (1)
      {
    	R = IORD_ALTERA_AVALON_PIO_DATA(RED_BASE);
    	G = IORD_ALTERA_AVALON_PIO_DATA(GREEN_BASE);
    	B = IORD_ALTERA_AVALON_PIO_DATA(BLUE_BASE);
    	SWITCHES = IORD_ALTERA_AVALON_PIO_DATA(SW_BASE);

    	if(R >= 0 && G >= 0 && B >= 0){
    		if (SWITCHES == 1){
    			redFilter(&G, &B);
    		}
    		else if (SWITCHES == 2){
    			greenFilter(&R, &B);
    		}
    		else if (SWITCHES == 4){
    			blueFilter(&R, &G);
    		}
    		else if (SWITCHES == 8){
    			grayScale(&R, &G, &B);
    		}
    		else if (SWITCHES == 16){
    			// SOBEL
    		}
    		IOWR_ALTERA_AVALON_PIO_DATA(RED_BASE, R);
    		IOWR_ALTERA_AVALON_PIO_DATA(GREEN_BASE, G);
    		IOWR_ALTERA_AVALON_PIO_DATA(BLUE_BASE, B);
    		IOWR_ALTERA_AVALON_PIO_DATA(SW_BASE, SWITCHES);
    	}

    	//mount sd card and dump file contents
		if (SWITCHES == 5){
			printf("Processing...\r\n");
			hFat = Fat_Mount(FAT_SD_CARD, 0);
			if (hFat){
				printf("sdcard mounted\n");
				//look for and dump contents of specified file
				Fat_Test(hFat, "raw.txt");
				Fat_Unmount(hFat);

				printf("Dumped contents of raw text/n");
			}else{
				printf("sd card not mounted, pls check for proper partition/n");
			}
		}


    }


  return 0;
}
