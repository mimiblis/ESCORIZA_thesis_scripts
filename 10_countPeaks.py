##PYTHON version 3.4##
######################
#this script allows to count the number of peaks/chromosome, tagged with a certain annotation
#############################################################################################

#this function calculates the number of peaks/chromosome, tagged with a certain annotation
def countPeaks(infile, outfile):

	inf = open(infile, 'r')
	outf = open(outfile, 'w')

	countU1 = 0; countD1 = 0; countI1 = 0; countC1 = 0; countST1 = 1; countE1 = 0
	countU2 = 0; countD2 = 0; countI2 = 0; countC2 = 0; countST2 = 1; countE2 = 0
	countU3 = 0; countD3 = 0; countI3 = 0; countC3 = 0; countST3 = 1; countE3 = 0
	countU4 = 0; countD4 = 0; countI4 = 0; countC4 = 0; countST4 = 1; countE4 = 0
	countU5 = 0; countD5 = 0; countI5 = 0; countC5 = 0; countST5 = 1; countE5 = 0
	countU6 = 0; countD6 = 0; countI6 = 0; countC6 = 0; countST6 = 1; countE6 = 0
	countU7 = 0; countD7 = 0; countI7 = 0; countC7 = 0; countST7 = 1; countE7 = 0
	countU8 = 0; countD8 = 0; countI8 = 0; countC8 = 0; countST8 = 1; countE8 = 0
	countU9 = 0; countD9 = 0; countI9 = 0; countC9 = 0; countST9 = 1; countE9 = 0
	countU10= 0; countD10 = 0; countI10 = 0; countC10 = 0; countST10 = 1; countE10 = 0
	countU11= 0; countD11 = 0; countI11 = 0; countC11 = 0; countST11 = 1; countE11 = 0
	countU12= 0; countD12 = 0; countI12 = 0; countC12 = 0; countST12 = 1; countE12 = 0
	countU13= 0; countD13 = 0; countI13 = 0; countC13 = 0; countST13 = 1; countE13 = 0
	countU14= 0; countD14 = 0; countI14 = 0; countC14 = 0; countST14 = 1; countE14 = 0
	countU15= 0; countD15 = 0; countI15 = 0; countC15 = 0; countST15 = 1; countE15 = 0
	countU16= 0; countD16 = 0; countI16 = 0; countC16 = 0; countST16 = 1; countE16 = 0
	countU17= 0; countD17 = 0; countI17 = 0; countC17 = 0; countST17 = 1; countE17 = 0
	countU18= 0; countD18 = 0; countI18 = 0; countC18 = 0; countST18 = 1; countE18 = 0
	countU19= 0; countD19 = 0; countI19 = 0; countC19 = 0; countST19 = 1; countE19 = 0
	countU20= 0; countD20 = 0; countI20 = 0; countC20 = 0; countST20 = 1; countE20 = 0
	countU21= 0; countD21 = 0; countI21 = 0; countC21 = 0; countST21 = 1; countE21 = 0
	countU22= 0; countD22 = 0; countI22 = 0; countC22 = 0; countST22 = 1; countE22 = 0

	for line in inf:
		if line.startswith('"chr1"'):
			if '"upstream"' in line:
				countU1 += 1
			elif '"downstream"' in line:
				countD1 += 1
			elif '"inside"' in line:
				countI1 += 1
			elif '"includeFeature"' in line:
				countC1 += 1
			elif '"overlapStart"' in line:
				countST1 += 1
			elif '"overlapEnd"' in line:
				countE1 += 1
		elif line.startswith('"chr2"'):
			if '"upstream"' in line:
				countU2 += 1
			elif '"downstream"' in line:
				countD2 += 1
			elif '"inside"' in line:
				countI2 += 1
			elif '"includeFeature"' in line:
				countC2 += 1
			elif '"overlapStart"' in line:
				countST2 += 1
			elif '"overlapEnd"' in line:
				countE2 += 1
		elif line.startswith('"chr3"'):
			if '"upstream"' in line:
				countU3 += 1
			elif '"downstream"' in line:
				countD3 += 1
			elif '"inside"' in line:
				countI3 += 1
			elif '"includeFeature"' in line:
				countC3 += 1
			elif '"overlapStart"' in line:
				countST3 += 1
			elif '"overlapEnd"' in line:
				countE3 += 1
		elif line.startswith('"chr4"'):
			if '"upstream"' in line:
				countU4 += 1
			elif '"downstream"' in line:
				countD4 += 1
			elif '"inside"' in line:
				countI4 += 1
			elif '"includeFeature"' in line:
				countC4 += 1
			elif '"overlapStart"' in line:
				countST4 += 1
			elif '"overlapEnd"' in line:
				countE4 += 1
		elif line.startswith('"chr5"'):
			if '"upstream"' in line:
				countU5 += 1
			elif '"downstream"' in line:
				countD5 += 1
			elif '"inside"' in line:
				countI5 += 1
			elif '"includeFeature"' in line:
				countC5 += 1
			elif '"overlapStart"' in line:
				countST5 += 1
			elif '"overlapEnd"' in line:
				countE5 += 1
		elif line.startswith('"chr6"'):
			if '"upstream"' in line:
				countU6 += 1
			elif '"downstream"' in line:
				countD6 += 1
			elif '"inside"' in line:
				countI6 += 1
			elif '"includeFeature"' in line:
				countC6 += 1
			elif '"overlapStart"' in line:
				countST6 += 1
			elif '"overlapEnd"' in line:
				countE6 += 1
		elif line.startswith('"chr7"'):
			if '"upstream"' in line:
				countU7 += 1
			elif '"downstream"' in line:
				countD7 += 1
			elif '"inside"' in line:
				countI7 += 1
			elif '"includeFeature"' in line:
				countC7 += 1
			elif '"overlapStart"' in line:
				countST7 += 1
			elif '"overlapEnd"' in line:
				countE7 += 1
		elif line.startswith('"chr8"'):
			if '"upstream"' in line:
				countU8 += 1
			elif '"downstream"' in line:
				countD8 += 1
			elif '"inside"' in line:
				countI8 += 1
			elif '"includeFeature"' in line:
				countC8 += 1
			elif '"overlapStart"' in line:
				countST8 += 1
			elif '"overlapEnd"' in line:
				countE8 += 1
		elif line.startswith('"chr9"'):
			if '"upstream"' in line:
				countU9 += 1
			elif '"downstream"' in line:
				countD9 += 1
			elif '"inside"' in line:
				countI9 += 1
			elif '"includeFeature"' in line:
				countC9 += 1
			elif '"overlapStart"' in line:
				countST9 += 1
			elif '"overlapEnd"' in line:
				countE9 += 1
		elif line.startswith('"chr10"'):
			if '"upstream"' in line:
				countU10 += 1
			elif '"downstream"' in line:
				countD10 += 1
			elif '"inside"' in line:
				countI10 += 1
			elif '"includeFeature"' in line:
				countC10 += 1
			elif '"overlapStart"' in line:
				countST10 += 1
			elif '"overlapEnd"' in line:
				countE10 += 1
		if line.startswith('"chr11"'):
			if '"upstream"' in line:
				countU11 += 1
			elif '"downstream"' in line:
				countD11 += 1
			elif '"inside"' in line:
				countI11 += 1
			elif '"includeFeature"' in line:
				countC11 += 1
			elif '"overlapStart"' in line:
				countST11 += 1
			elif '"overlapEnd"' in line:
				countE11 += 1
		elif line.startswith('"chr12"'):
			if '"upstream"' in line:
				countU12 += 1
			elif '"downstream"' in line:
				countD12 += 1
			elif '"inside"' in line:
				countI12 += 1
			elif '"includeFeature"' in line:
				countC12 += 1
			elif '"overlapStart"' in line:
				countST12 += 1
			elif '"overlapEnd"' in line:
				countE12 += 1
		elif line.startswith('"chr13"'):
			if '"upstream"' in line:
				countU13 += 1
			elif '"downstream"' in line:
				countD13 += 1
			elif '"inside"' in line:
				countI13 += 1
			elif '"includeFeature"' in line:
				countC13 += 1
			elif '"overlapStart"' in line:
				countST13 += 1
			elif '"overlapEnd"' in line:
				countE13 += 1
		elif line.startswith('"chr14"'):
			if '"upstream"' in line:
				countU14 += 1
			elif '"downstream"' in line:
				countD14 += 1
			elif '"inside"' in line:
				countI14 += 1
			elif '"includeFeature"' in line:
				countC14 += 1
			elif '"overlapStart"' in line:
				countST14 += 1
			elif '"overlapEnd"' in line:
				countE14 += 1
		elif line.startswith('"chr15"'):
			if '"upstream"' in line:
				countU15 += 1
			elif '"downstream"' in line:
				countD15 += 1
			elif '"inside"' in line:
				countI15 += 1
			elif '"includeFeature"' in line:
				countC15 += 1
			elif '"overlapStart"' in line:
				countST15 += 1
			elif '"overlapEnd"' in line:
				countE15 += 1
		elif line.startswith('"chr16"'):
			if '"upstream"' in line:
				countU16 += 1
			elif '"downstream"' in line:
				countD16 += 1
			elif '"inside"' in line:
				countI16 += 1
			elif '"includeFeature"' in line:
				countC16 += 1
			elif '"overlapStart"' in line:
				countST16 += 1
			elif '"overlapEnd"' in line:
				countE16 += 1
		elif line.startswith('"chr17"'):
			if '"upstream"' in line:
				countU17 += 1
			elif '"downstream"' in line:
				countD17 += 1
			elif '"inside"' in line:
				countI17 += 1
			elif '"includeFeature"' in line:
				countC17 += 1
			elif '"overlapStart"' in line:
				countST17 += 1
			elif '"overlapEnd"' in line:
				countE17 += 1
		elif line.startswith('"chr18"'):
			if '"upstream"' in line:
				countU18 += 1
			elif '"downstream"' in line:
				countD18 += 1
			elif '"inside"' in line:
				countI18 += 1
			elif '"includeFeature"' in line:
				countC18 += 1
			elif '"overlapStart"' in line:
				countST18 += 1
			elif '"overlapEnd"' in line:
				countE18 += 1
		elif line.startswith('"chr19"'):
			if '"upstream"' in line:
				countU19 += 1
			elif '"downstream"' in line:
				countD19 += 1
			elif '"inside"' in line:
				countI19 += 1
			elif '"includeFeature"' in line:
				countC19 += 1
			elif '"overlapStart"' in line:
				countST19 += 1
			elif '"overlapEnd"' in line:
				countE19 += 1
		elif line.startswith('"chr20"'):
			if '"upstream"' in line:
				countU20 += 1
			elif '"downstream"' in line:
				countD20 += 1
			elif '"inside"' in line:
				countI20 += 1
			elif '"includeFeature"' in line:
				countC20 += 1
			elif '"overlapStart"' in line:
				countST20 += 1
			elif '"overlapEnd"' in line:
				countE20 += 1
		elif line.startswith('"chr21"'):
			if '"upstream"' in line:
				countU21 += 1
			elif '"downstream"' in line:
				countD21 += 1
			elif '"inside"' in line:
				countI21 += 1
			elif '"includeFeature"' in line:
				countC21 += 1
			elif '"overlapStart"' in line:
				countST21 += 1
			elif '"overlapEnd"' in line:
				countE21 += 1
		elif line.startswith('"chr22"'):
			if '"upstream"' in line:
				countU22 += 1
			elif '"downstream"' in line:
				countD22 += 1
			elif '"inside"' in line:
				countI22 += 1
			elif '"includeFeature"' in line:
				countC22 += 1
			elif '"overlapStart"' in line:
				countST22 += 1
			elif '"overlapEnd"' in line:
				countE22 += 1

	outf.write('upstream'+'\t'+'downstream'+'\t'+'insideFeature'+'\t'+'includeFeature'+'\t'+'overlapStart'+'\t'+'overlapEnd'+'\n'+
		str(countU1)+'\t'+ str(countD1)+'\t'+  str(countI1)+'\t'+ str(countC1)+'\t'+ str(countST1)+'\t'+ str(countE1)+'\n' +
		str(countU2)+'\t'+ str(countD2)+'\t'+  str(countI2)+'\t'+ str(countC2)+'\t'+ str(countST2)+'\t'+ str(countE2)+'\n'+
		str(countU3)+'\t'+ str(countD3)+'\t'+  str(countI3)+'\t'+ str(countC3)+'\t'+ str(countST3)+'\t'+ str(countE3)+'\n'+
		str(countU4)+'\t'+ str(countD4)+'\t'+  str(countI4)+'\t'+ str(countC4)+'\t'+ str(countST4)+'\t'+ str(countE4)+'\n'+
		str(countU5)+'\t'+ str(countD5)+'\t'+  str(countI5)+'\t'+ str(countC5)+'\t'+ str(countST5)+'\t'+ str(countE5)+'\n'+
		str(countU6)+'\t'+ str(countD6)+'\t'+  str(countI6)+'\t'+ str(countC6)+'\t'+ str(countST6)+'\t'+ str(countE6)+'\n'+
		str(countU7)+'\t'+ str(countD7)+'\t'+  str(countI7)+'\t'+ str(countC7)+'\t'+ str(countST7)+'\t'+ str(countE7)+'\n'+
		str(countU8)+'\t'+ str(countD8)+'\t'+  str(countI8)+'\t'+ str(countC8)+'\t'+ str(countST8)+'\t'+ str(countE8)+'\n'+
		str(countU9)+'\t'+ str(countD9)+'\t'+  str(countI9)+'\t'+ str(countC9)+'\t'+ str(countST9)+'\t'+ str(countE9)+'\n'+
		str(countU10)+'\t'+ str(countD10)+'\t'+  str(countI10)+'\t'+ str(countC10)+'\t'+ str(countST10)+'\t'+ str(countE10)+'\n'+
		str(countU11)+'\t'+ str(countD11)+'\t'+  str(countI11)+'\t'+ str(countC11)+'\t'+ str(countST11)+'\t'+ str(countE11)+'\n' +
		str(countU12)+'\t'+ str(countD12)+'\t'+  str(countI12)+'\t'+ str(countC12)+'\t'+ str(countST12)+'\t'+ str(countE12)+'\n'+
		str(countU13)+'\t'+ str(countD13)+'\t'+  str(countI13)+'\t'+ str(countC13)+'\t'+ str(countST13)+'\t'+ str(countE13)+'\n'+
		str(countU14)+'\t'+ str(countD14)+'\t'+  str(countI14)+'\t'+ str(countC14)+'\t'+ str(countST14)+'\t'+ str(countE14)+'\n'+
		str(countU15)+'\t'+ str(countD15)+'\t'+  str(countI15)+'\t'+ str(countC15)+'\t'+ str(countST15)+'\t'+ str(countE15)+'\n'+
		str(countU16)+'\t'+ str(countD16)+'\t'+  str(countI16)+'\t'+ str(countC16)+'\t'+ str(countST16)+'\t'+ str(countE16)+'\n'+
		str(countU17)+'\t'+ str(countD17)+'\t'+  str(countI17)+'\t'+ str(countC17)+'\t'+ str(countST17)+'\t'+ str(countE17)+'\n'+
		str(countU18)+'\t'+ str(countD18)+'\t'+  str(countI18)+'\t'+ str(countC18)+'\t'+ str(countST18)+'\t'+ str(countE18)+'\n'+
		str(countU19)+'\t'+ str(countD19)+'\t'+  str(countI19)+'\t'+ str(countC19)+'\t'+ str(countST19)+'\t'+ str(countE19)+'\n'+
		str(countU20)+'\t'+ str(countD20)+'\t'+  str(countI20)+'\t'+ str(countC20)+'\t'+ str(countST20)+'\t'+ str(countE20)+'\n'+
		str(countU21)+'\t'+ str(countD21)+'\t'+  str(countI21)+'\t'+ str(countC21)+'\t'+ str(countST21)+'\t'+ str(countE21)+'\n'+
		str(countU22)+'\t'+ str(countD22)+'\t'+  str(countI22)+'\t'+ str(countC22)+'\t'+ str(countST22)+'\t'+ str(countE22))

print('counting for YvsO, human')
countPeaks('YvsO_anno_protCodGenes.tab', 'YvsO_peakCount_human.tab')
print('counting for OvsY, human')
countPeaks('OvsY_anno_protCodGenes.tab', 'OvsY_peakCount_human.tab')
print('counting for YvsO, macaque')
countPeaks('YvsO-mac_anno_protCodGenes.tab', 'YvsO_peakCount_macaque.tab')
print('counting for OvsY, macaque')
countPeaks('YvsO-mac_anno_protCodGenes.tab', 'OvsY_peakCount_macaque.tab')