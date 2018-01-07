%% measures: function description
function res = measures(confusion)

	f0TP = confusion(1,1);
	f0TN = confusion(2,2) + confusion(2,3) + confusion(3,2) + confusion(3,3);
	f0FP = confusion(1,2) + confusion(1,3);
	f0FN = confusion(2,1) + confusion(3,1);

	f0TPR = f0TP / (f0TP + f0FN);
	f0TNR = f0TN / (f0TN + f0FP);
	f0Prec = f0TP / (f0TP + f0FP);	

	f1TP = confusion(2,2);
	f1TN = confusion(1,1) + confusion(3,3) + confusion(1,3) + confusion(3,1);
	f1FP = confusion(2,1) + confusion(2,3);
	f1FN = confusion(1,2) + confusion(3,2);

	f1TPR = f1TP / (f1TP + f1FN);
	f1TNR = f1TN / (f1TN + f1FP);
	f1Prec = f1TP / (f1TP + f1FP);

	f2TP = confusion(3,3);
	f2TN = confusion(1,1) + confusion(2,2) + confusion(1,2) + confusion(2,1);
	f2FP = confusion(3,1) + confusion(3,2);
	f2FN = confusion(1,3) + confusion(2,3);

	f2TPR = f2TP / (f2TP + f2FN);
	f2TNR = f2TN / (f2TN + f2FP);
	f2Prec = f2TP / (f2TP + f2FP);

	res = [f0TPR f1TPR f2TPR; f0TNR f1TNR f2TNR; f0Prec f1Prec f2Prec];
    res(isnan(res))=0;
end