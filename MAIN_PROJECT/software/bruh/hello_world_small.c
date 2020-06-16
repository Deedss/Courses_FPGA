#include "sys/alt_stdio.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "stdio.h"
#include "sys/alt_flash.h"
#include "terasic_lib\terasic_includes.h"
#include "terasic_fat\FatFileSystem.h"

bool Fat_Test(FAT_HANDLE hFat, char *pDumpFile){
    bool bSuccess;
    int nCount = 0;
    FAT_BROWSE_HANDLE hBrowse;
    FILE_CONTEXT FileContext;

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
                    //
                    pData16++;
                }
                printf("\n");
            }else{
                printf("[%d]%s\n", nCount, FileContext.szName);
            }
            nCount++;
        }
    }
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
            printf("Cannot find the file \"%s\"\n", pDumpFile);
        }
    }

    return bSuccess;
}


uint R, G, B;
int SWITCHES;

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
	*R = *G = *B = ((*R + *G + *B) / 3);
	return;
}

int main()
{
  alt_putstr("Hello from Nios II!\n");

  /* Event loop never exits. */
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
		IOWR_ALTERA_AVALON_PIO_DATA(RED_BASE, R);
		IOWR_ALTERA_AVALON_PIO_DATA(GREEN_BASE, G);
		IOWR_ALTERA_AVALON_PIO_DATA(BLUE_BASE, B);
		IOWR_ALTERA_AVALON_PIO_DATA(SW_BASE, SWITCHES);
	}
  }
  return 0;
}
