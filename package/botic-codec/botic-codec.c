/*
 * ASoC simple sound codec support
 *
 * Miroslav Rudisin <miero@seznam.cz>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 */
#include <linux/module.h>
#include <linux/platform_device.h>
#include <linux/of_platform.h>
#include <linux/gpio/consumer.h>
#include <sound/core.h>
#include <sound/pcm.h>
#include <sound/soc.h>

/* External module: include config */
#include <generated/autoconf.h>

#define BOTIC_CODEC_NAME "botic-codec"
#define BOTIC_CODEC_DAI_NAME "botic-hifi"

#define BOTIC_RATES SNDRV_PCM_RATE_KNOT

#define BOTIC_FORMATS (\
            SNDRV_PCM_FMTBIT_S16_LE | \
            SNDRV_PCM_FMTBIT_S24_3LE | \
            SNDRV_PCM_FMTBIT_S24_LE | \
            SNDRV_PCM_FMTBIT_S32_LE | \
            SNDRV_PCM_FMTBIT_DSD_U32_LE | \
            0)

/* codec private data */
struct botic_priv {
	struct gpio_desc *mute;
};

static int botic_startup(struct snd_pcm_substream *substream,
            struct snd_soc_dai *dai)
{
    struct snd_soc_component *component = dai->component;
    struct botic_priv *botic = snd_soc_component_get_drvdata(component);

    gpiod_set_value_cansleep(botic->mute, 1);

    return 0;
}

static void botic_shutdown(struct snd_pcm_substream *substream,
            struct snd_soc_dai *dai)
{
	struct snd_soc_component *component = dai->component;
	struct botic_priv *botic = snd_soc_component_get_drvdata(component);

	gpiod_set_value_cansleep(botic->mute, 0);
}

static int botic_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
{
	struct botic_priv *botic = snd_soc_component_get_drvdata(dai->component);

	if (botic->mute)
		gpiod_set_value_cansleep(botic->mute, mute);

	return 0;
}

static struct snd_soc_dai_ops botic_dai_ops = {
    .startup        = botic_startup,
    .shutdown       = botic_shutdown,
	.mute_stream    = botic_mute_stream,
};

static struct snd_soc_dai_driver botic_codec_dai = {
    .name = BOTIC_CODEC_DAI_NAME,
    .playback = {
        .channels_min = 2,
        .channels_max = 8,
        .rate_min = 22050,
        .rate_max = 384000,
        .rates = BOTIC_RATES,
        .formats = BOTIC_FORMATS,
    },
    .capture = {
        .channels_min = 2,
        .channels_max = 8,
        .rate_min = 22050,
        .rate_max = 384000,
        .rates = BOTIC_RATES,
        .formats = BOTIC_FORMATS,
    },
    .ops = &botic_dai_ops,
};

static const struct snd_kcontrol_new botic_codec_controls[] = {
    /* Dummy controls for some applications that requires ALSA controls. */
    SOC_DOUBLE("Master Playback Volume", 0, 0, 0, 32, 1),
    SOC_SINGLE("Master Playback Switch", 1, 0, 1, 1),
};

static struct snd_soc_component_driver botic_codec_socdrv = {
    .controls = botic_codec_controls,
    .num_controls = ARRAY_SIZE(botic_codec_controls),
    .idle_bias_on = 1,
    .use_pmdown_time = 1,
    .endianness = 1,
    .non_legacy_dai_naming = 1,
};

static int asoc_botic_codec_probe(struct platform_device *pdev)
{
    struct botic_priv *botic;
	int ret;

    botic = devm_kzalloc(&pdev->dev, sizeof(struct botic_priv),
						  GFP_KERNEL);
    if (botic == NULL)
        return -ENOMEM;

    platform_set_drvdata(pdev, botic);

    botic->mute = devm_gpiod_get(&pdev->dev, "mute", GPIOD_OUT_LOW);
    if (IS_ERR(botic->mute)) {
        ret = PTR_ERR(botic->mute);
        dev_err(&pdev->dev, "Failed to get mute line: %d\n", ret);
        return ret;
    }

    ret = snd_soc_register_component(&pdev->dev,
            &botic_codec_socdrv, &botic_codec_dai, 1);

    if (ret < 0)
        dev_err(&pdev->dev, "Failed to register component: %d\n", ret);

	return ret;
}

#if defined(CONFIG_OF)
static const struct of_device_id asoc_botic_codec_dt_ids[] = {
    { .compatible = "botic-audio-codec" },
    { },
};

MODULE_DEVICE_TABLE(of, asoc_botic_codec_dt_ids);
#endif

static struct platform_driver asoc_botic_codec_driver = {
    .probe = asoc_botic_codec_probe,
    .driver = {
        .name = "asoc-botic-codec",
        .of_match_table = of_match_ptr(asoc_botic_codec_dt_ids),
    },
};

module_platform_driver(asoc_botic_codec_driver);

MODULE_AUTHOR("Miroslav Rudisin");
MODULE_DESCRIPTION("ASoC Botic sound codec");
MODULE_LICENSE("GPL");
MODULE_ALIAS("platform:asoc-botic-codec");
