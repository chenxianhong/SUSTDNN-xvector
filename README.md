# SUSTDNN-xvector
This is a Tensorflow implementation of x-vector with speech-unit-specific TDNN (SUSTDNN)for speaker verification.

It is modified based on the Tensorflow implementation of x-vector topology proposed by David Snyder in Deep Neural Network Embeddings for Text-Independent Speaker Verfication: https://github.com/hsn-zeinali/x-vector-kaldi-tf.

We use phoneme recognizer from Brno University of Technology to get phoneme probability for SUSTDNN construcation. https://speech.fit.vutbr.cz/software/but-phonexia-bottleneck-feature-extractor.



## Usage

For using the codes, you first should install Kaldi and clone the codes in egs/sre16 (or somewhere else that you want, by changing the symlinks to proper positions). 

Move apply-cmvn-sliding-23dim.cc and make_kaldi_single_file.sh to kaldi⁩/⁨src⁩/featbin⁩/, make apply-cmvn-sliding-23dim.cc using make_kaldi_single_file.sh (remember to change the file path in make_kaldi_single_file.sh)

Before run run_sre10_10sec.sh and run_sre10_core.sh, run run_sre10_coreext.sh first.

If you want to test different topology, you can add a subclass of Model to local/tf/models.py and overwrite the build_model function (in the file you can see several topologies). Then you just need to pass class name to local/tf/train_dnn.py by changing --tf-model-class in local/tf/run_xvector.sh.

    In local/tf/models.py, ModelL2LossWithoutDropoutLReluAttention_63dim is our baseline. 
    It is in fact the same as ModelL2LossWithoutDropoutLReluAttention except that its input feature are 63 dimensional. 
    Only the first 23 MFCCs are used. The following 40 dimensions are phoneme posterior.
    ModelL2LossWithoutDropoutLReluAttentionPhoneme is x-vector with SUSTDNN without phoneme classification.
    ModelL2LossWithoutDropoutLReluAttentionPhonemeCluster is x-vector with SUSTDNN and phoneme classification.
    ModelL2LossWithoutDropoutLReluAttentionPhonemeCluster2layer is x-vector with SUSTDNN and phoneme classification. The first two TDNN layers are replaced with SUSTDNN layers.
    ModelL2LossWithoutDropoutLReluAttentionPhonemeClusterFig2a is x-vector with SUSTDNN and phoneme classification. Fig.2(a) is used as the realizaiton of SUSTDNN.


## Requirements

    Kaldi from https://github.com/kaldi-asr/kaldi
    Python
    NumPy
    TensorFlow


## License

Apache License, Version 2.0 ('LICENSE')

